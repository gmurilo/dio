import axios from 'axios';

const api = axios.create({
    baseURL: window.location.origin
});

export { api }