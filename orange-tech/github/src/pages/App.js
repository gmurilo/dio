import { useState } from 'react';
import background from '../assets/img/background.png';
import Button from '../components/Button';
import Input from '../components/Input';
import ItemRepo from '../components/ItemRepo';
import { Container } from './styles';
import { api } from '../services/api';

function App() {

  const [currentRepo, setCurrentRepo] = useState('');
  const [repos, setRepos] = useState([]);
  const [disabled, setDisabled] = useState(true);
  const removeOnlyAfterExclude = true;
  const handleSearchRepos = async () => {
    let input = document.querySelector("input");
    let err = "";
    try {
      if( currentRepo === "") {
        throw new Error('Repositório não informado.');
      }
      const { data } = await api.get(`repos/gmurilo/${currentRepo}`)
      if (data.id) {
        const isExist = repos.find(repo => repo.id === data.id);
        if (!isExist) {
          setRepos(prev => [...prev, data]);
        }
        else {
          throw new Error('Repositório já incluido.');
        }
      }
    }
    catch(e) {
      if ( e.code === "ERR_BAD_REQUEST") {
        err = "Repositório não encontrado.";
      }
      else {
        err = e.message;
      }
      setCurrentRepo('');
      input.value = "";
      console.log(err);
      return;
    }
    finally {
      setCurrentRepo('');
      input.value = "";
      if (err.length > 0) {
        alert(err);
      }
    }
  }

  const handleRemoveRepo = async (id) => {
    let repository = { name: "" }, err = "";
    let input = document.querySelector("input");
    const newRepos = repos.filter(repo => { 
      if ( repo.id !== id ) {
        return true;
      }
      else {
        repository = repo;
        return false;
      }
    });
    try {
      if( repository.name === "") {
        throw new Error('Repositório não informado.');
      }
      const { data } = await api.delete(`repos/gmurilo/${repository.name}`);
      setRepos(newRepos);
    }
    catch(e) {
      if ( e.message.match(/status code 403$/gi) ) {
        console.log(e);
        err = "Você não possui permissão para excluir o diretório.";
      }
      else if ( e.message.match(/status code$/gi) ) {
        console.log(e);
        err = e.message;
      }
      else {
        err = e.message;
      }
      setCurrentRepo('');
      input.value = "";
      console.log(err);
      return;
    }
    finally {
      setCurrentRepo('');
      input.value = "";
      if (err.length > 0) {
        alert(err);
      }
      if ( removeOnlyAfterExclude === false ) {
        setRepos(newRepos);
      }
    }
  };

  return (
    <Container>
      <img src={background} width={72} height={72} alt='github logo' />
      <Input value={currentRepo} onChange={(e) => { setCurrentRepo(e.target.value); if(e.target.value.length > 0 ) { setDisabled(false);} else { setDisabled(true); } } } />
      <Button onClick={handleSearchRepos} disable={disabled}/>
      {repos.map(repo => <ItemRepo handleRemoveRepo={handleRemoveRepo} repo={repo} />)}
    </Container>
  );
}

export default App;
