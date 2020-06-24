      IDENTIFICATION DIVISION.                                           
      PROGRAM-ID. ITEMDETAILS. 
      DATA DIVISION.                                                 
      LINKAGE SECTION.                                                         
         01 ITEM-NUM        PIC 9(8).                                          
         01 ITEM-RECORD.                                                       
           02 ITEM-NAME     PIC X(16).                                         
           02 DESCRIPTION   PIC X(28).                                               
           02 WEIGHT        PIC 9(4).                                                
         01 SHIPPING.                                                                
           02 SHIPPING-METHOD        PIC X(10).                                               
           02 DAYS          PIC 9(4).                                                
      PROCEDURE DIVISION USING ITEM-NUM ITEM-RECORD SHIPPING.                        
      BEGIN.                                                                         
          MOVE 'AIR MAIL  ' TO SHIPPING-METHOD.                                               
          MOVE 2 TO DAYS.                                                            
          EVALUATE ITEM-NUM                                                          
            WHEN  1000                                                               
               MOVE 'Kid Guitar     ' TO ITEM-NAME                                   
               MOVE 'Kids Guitar - Musical Toys   ' TO       DESCRIPTION             
               MOVE 200 TO WEIGHT                                                    
            WHEN 1001                                                                
                 MOVE 'Ball Pool      ' TO ITEM-N      AME                           
                 MOVE 'Ball Pool - Novelty Toys   ' TO DESCRIPTION             
                 MOVE 100 TO WEIGHT                                            
            WHEN 1002                                                          
                 MOVE 'Water Ball     ' TO ITEM-NAME                           
                 MOVE 'Water Ball - Balls         ' TO DESCRIPTION             
                 MOVE 1000 TO WEIGHT                                           
             WHEN 1003                                                         
                 MOVE 'Frisbee        ' TO ITEM-NAME                           
                 MOVE  'Dog Frisbee - Pet Toys     ' TO DESCRIPTION            
                 MOVE 5000 TO WEIGHT                                           
            WHEN 1004                                                          
                 MOVE 'Pig Bank       ' TO ITEM-NAME                           
                 MOVE 'Pig Saving Bank - Ceramics ' TO DESCRIPTION             
                 MOVE 5000 TO WEIGHT                                           
            WHEN OTHER                                                         
               MOVE 0 TO WEIGHT                                                
               MOVE 'ERROR          ' TO ITEM-NAME                             
               MOVE 'OBJECT NOT FOUND          ' TO DESCRIPTION                
          END-EVALUATE.                                                        
      HALT.                                                                    
