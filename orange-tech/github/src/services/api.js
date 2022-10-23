import axios from "axios";
const OAUTHTOKEN = "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";
const config = {
    baseURL: "https://api.github.com/",
    headers: {
        "Authorization" : "Bearer " + OAUTHTOKEN
    }
};
export const api = axios.create(config);