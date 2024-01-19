import {  useState } from 'react'
import {useEffect} from 'react'
import BooksList from './BooksList'
    

const SearchBook = () => {
    const [books, setbooks] = useState([])
    const [input, setInput] = useState('')

    useEffect(()=>{
        getBooks()
    },[input])

    const getBooks = async()=>{
        const res= await fetch(`https://www.googleapis.com/books/v1/volumes?q=${input}&key=AIzaSyAViJaCqAV8dBVY4yrPuURxQCwU4Y0QUVQ`)
        const data = await res.json()
        console.log(data.items);
        if(data.items){
            setbooks(data.items)
        }
        
    }

    return (
    <>
    <div className='input-container'>
        <input className='search-bar' type='text' value={input} onChange={(e)=>{setInput(e.target.value)}} placeholder='Search for Books...'  />
     
        
    </div>
    <BooksList books = {books}/>
    </>
    );
}


export default SearchBook;