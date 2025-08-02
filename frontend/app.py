import streamlit as st
import requests

BACKEND_URL = "http://localhost:8000"

st.title("🔁 FastAPI + Streamlit Demo")

# GET request
if st.button("Ping Backend"):
    r = requests.get(f"{BACKEND_URL}/ping")
    st.write(r.json())

# POST request
st.subheader("Send Message")
name = st.text_input("Name")
message = st.text_area("Message")

if st.button("Send"):
    payload = {"name": name, "message": message}
    r = requests.post(f"{BACKEND_URL}/echo", json=payload)
    st.write(r.json())
