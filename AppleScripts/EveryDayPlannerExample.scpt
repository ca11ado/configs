FasdUAS 1.101.10   ��   ��    k             l      ��  ��    ~ x

Appends an entry to today�s Daily Record of Events in Evernote.

For best results, invoke the script from LaunchBar.

     � 	 	 � 
 
 A p p e n d s   a n   e n t r y   t o   t o d a y  s   D a i l y   R e c o r d   o f   E v e n t s   i n   E v e r n o t e . 
 
 F o r   b e s t   r e s u l t s ,   i n v o k e   t h e   s c r i p t   f r o m   L a u n c h B a r . 
 
   
  
 l     ��������  ��  ��        i         I     ������
�� .aevtoappnull  �   � ****��  ��    l         k            r     	    b         m        �   6 D a i l y   R e c o r d   o f   E v e n t s   f o r    l    ����  I   �� ��
�� .sysoexecTEXT���     TEXT  m       �   " d a t e   ' + % A ,   % B   % e '��  ��  ��    o      ���� 0 thetitle theTitle     !   I  
 �� " #
�� .sysodlogaskr        TEXT " m   
  $ $ � % % H W h a t   d i d   y o u   d o   t o   r e a c h   y o u r   g o a l s ? # �� & '
�� 
dtxt & m     ( ( � ) )   ' �� *��
�� 
appr * o    ���� 0 thetitle theTitle��   !  +�� + I    �� ,���� 0 handle_string   ,  -�� - l    .���� . n    / 0 / 1    ��
�� 
ttxt 0 1    ��
�� 
rslt��  ��  ��  ��  ��    - ' Called when the script is run normally     � 1 1 N   C a l l e d   w h e n   t h e   s c r i p t   i s   r u n   n o r m a l l y   2 3 2 l     ��������  ��  ��   3  4 5 4 i     6 7 6 I      �� 8���� 0 handle_string   8  9�� 9 o      ���� 0 str  ��  ��   7 l    \ : ; < : k     \ = =  > ? > O     Z @ A @ k    Y B B  C D C l   ��������  ��  ��   D  E F E l   �� G H��   G ' ! add a blank line between entries    H � I I B   a d d   a   b l a n k   l i n e   b e t w e e n   e n t r i e s F  J K J r    	 L M L b     N O N o    ���� 0 str   O m     P P � Q Q  < b r   / > M o      ���� 0 newhtml newHTML K  R S R l  
 
��������  ��  ��   S  T U T r   
  V W V 4   
 �� X
�� 
EVnb X m     Y Y � Z Z  P l a n n e r W o      ���� 0 thenotebook theNoteBook U  [ \ [ r     ] ^ ] b     _ ` _ m     a a � b b  D a i l y   R e c o r d   ` l    c���� c I   �� d��
�� .sysoexecTEXT���     TEXT d m     e e � f f   d a t e   ' + % Y - % m - % d '��  ��  ��   ^ o      ���� 0 	notetitle 	noteTitle \  g h g r    ) i j i 6   ' k l k n     m n m 2    ��
�� 
EVnn n o    ���� 0 thenotebook theNoteBook l =   & o p o 1     "��
�� 
EVet p o   # %���� 0 	notetitle 	noteTitle j o      ���� 0 
todaynotes 
todayNotes h  q r q Z   * W s t�� u s =  * / v w v n   * - x y x 1   + -��
�� 
leng y o   * +���� 0 
todaynotes 
todayNotes w m   - .����   t I  2 =���� z
�� .EVRNcrntnull��� ��� null��   z �� { |
�� 
Enhl { o   4 5���� 0 newhtml newHTML | �� } ~
�� 
Entt } o   6 7���� 0 	notetitle 	noteTitle ~ �� ��
�� 
Ennb  o   8 9���� 0 thenotebook theNoteBook��  ��   u k   @ W � �  � � � r   @ H � � � n   @ F � � � 4  A F�� �
�� 
cobj � m   D E����  � o   @ A���� 0 
todaynotes 
todayNotes � o      ���� 0 thenote theNote �  ��� � O   I W � � � I  M V���� �
�� .EVRNadtnnull���     EVnn��   � �� ���
�� 
EV19 � o   Q R���� 0 newhtml newHTML��   � o   I J���� 0 thenote theNote��   r  � � � l  X X��������  ��  ��   �  ��� � l  X X��������  ��  ��  ��   A m      � ��                                                                                  EVRN  alis    V  Macintosh HD               �/��H+     GEvernote.app                                                    	�W�6�z        ����  	                Applications    �/�Y      �6�J       G  'Macintosh HD:Applications: Evernote.app     E v e r n o t e . a p p    M a c i n t o s h   H D  Applications/Evernote.app   / ��   ?  ��� � l  [ [��������  ��  ��  ��   ; 2 , Called directly when invoked from LaunchBar    < � � � X   C a l l e d   d i r e c t l y   w h e n   i n v o k e d   f r o m   L a u n c h B a r 5  ��� � l     ��������  ��  ��  ��       �� � � � �����   � ��������
�� .aevtoappnull  �   � ****�� 0 handle_string  �� 0 thetitle theTitle��   � �� ���� � ���
�� .aevtoappnull  �   � ****��  ��   �   �   ���� $�� (������������
�� .sysoexecTEXT���     TEXT�� 0 thetitle theTitle
�� 
dtxt
�� 
appr�� 
�� .sysodlogaskr        TEXT
�� 
rslt
�� 
ttxt�� 0 handle_string  �� ��j %E�O������ 	O*��,k+  � �� 7���� � ����� 0 handle_string  �� �� ���  �  ���� 0 str  ��   � �������������� 0 str  �� 0 newhtml newHTML�� 0 thenotebook theNoteBook�� 0 	notetitle 	noteTitle�� 0 
todaynotes 
todayNotes�� 0 thenote theNote �  � P�� Y a e���� �����~�}�|�{�z�y�x�w
�� 
EVnb
�� .sysoexecTEXT���     TEXT
�� 
EVnn �  
�� 
EVet
� 
leng
�~ 
Enhl
�} 
Entt
�| 
Ennb�{ 
�z .EVRNcrntnull��� ��� null
�y 
cobj
�x 
EV19
�w .EVRNadtnnull���     EVnn�� ]� W��%E�O*��/E�O��j %E�O��-�[�,\Z�81E�O��,j  *����� Y �a k/E�O� *a �l UOPUOP � � � � \ D a i l y   R e c o r d   o f   E v e n t s   f o r   W e d n e s d a y ,   M a r c h     8��  ascr  ��ޭ