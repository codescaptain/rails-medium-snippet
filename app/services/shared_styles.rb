module SharedStyles
  def self.css_style
    <<-CSS
      <style>
      @media (max-width: 480px) {
        .flex-container {
          display: flex;
          flex-direction: column;
          background-color: white;
          align-items: center;
        }
        h2 {
          margin-bottom: 10px;
          text-align: center;
        }
      
        p {
          text-align: center;
         }
         
        .category-container{
            display: flex;
            align-items: center;
            justify-content: center;
        }
      }
  
        img {
          max-width: 150px;
          border-radius: 10px;
          margin-top: 20px;
        }
  
        .flex-container {
          display: flex;
          background-color: white;
          align-items: center;
          -webkit-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          -moz-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          border-radius:20px;
          max-width: 700px;
          position: relative;
        }
  
        .flex-col {
          flex-direction: column;
          display: flex;
          margin-left: 1rem;
        }
      
        h2 {
          margin-bottom: 0px;
        }
        
        .pub-date{
        text-align: center;
        font-weight: 900;
        font-size: smaller;
        opacity: 0.75;
        }
    
        .category-container{
        display: flex;
        }
        
        .the-category{
          margin-left: 5px;
          padding-top: 2px;
          padding-bottom: 2px;
          padding-right: 5px;
          padding-left: 5px;
          border: solid 1px gray;
          border-radius: 3px;
          -webkit-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          -moz-box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          box-shadow: 9px 10px 28px -7px rgba(128,112,128,0.71);
          font-size: small;
        }
      </style>
    CSS
  end
end