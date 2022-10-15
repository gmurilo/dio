import sqlalchemy
from sqlalchemy.orm import declarative_base, relationship
from sqlalchemy import Column, Integer, String, Float, LargeBinary, ForeignKey

Base = declarative_base()

class Cliente(Base):
    __tablename__ = "Cliente"
    
    id = Column(Integer, primary_key = True)
    nome = Column(String)
    cpf = Column(String(9))
    endereco = Column(String(9))

    def __repr__(self):
        return f"Cliente(id={self.id}, nome={self.name}, cpf={self.cpf}, endereco={self.endereco})"

class Conta(Base):
    __tablename__ = "Conta"
    id = Column(LargeBinary, primary_key=True)
    tipo = Column(String)
    agencia = Column(String)
    num = Column(Integer)
    id_cliente = Column(Integer, ForeignKey("Cliente.id"), nullable = False)
    saldo = Column(Float)   
    cliente = relationship("Cliente", back_populates="Conta")

    def __repr__(self):
        return f"Conta(id={self.id}, tipo={self.tipo}, agencia={self.agencia}, num={self.num}, id_cliente={self.id_cliente})"