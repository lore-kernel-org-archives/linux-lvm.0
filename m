Return-Path: <rshukla@prl.ernet.in>
Date: Tue, 3 Jul 2001 18:12:59 +0530 (IST)
From: RAGHVENDRA SHUKLA <rshukla@prl.ernet.in>
Message-Id: <Pine.A32.4.21.0107031806220.54566-100000@prlfs.prl.ernet.in>
Mime-Version: 1.0
Subject: [linux-lvm] Parted not making partitions
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello ,
       My lINUX RED HAT 7.1 HAS THE disk partitions ( as given by parted
-print ) are as follows :

    1 	0.031	23.532		ext2	boot
    2	23.533	28623.625	extended
    5   23.563	1357.053	logical	ext2
    6 	28027.494	28529.494	logical	linux-swap


    Now i know that there is space between the 1357.053 - 28027.494 ,
( as i have reduced this partition by myself and this is root )
whenever i give the command --> mkpart primary ext2 1357.054 28027.493
then it says that the partition overlaps . This is not clear to me .

Thanks in advance .

Raghav

	 

-------------------------------------------------------------------------------------
Name : Raghvendra Narain Shukla
       ( Engineer - SC )                     Address:Computer Centre,
Email: rshukla@prl.ernet.in ,                        Physical Research Laboratory 
       raghvendra55@yahoo.com                        Ahmedabad 380 015  
Phone: +91 79 630-2129  ext. 4036 (0)                INDIA  
FAX  : +91 79 630-1502                                           
--------------------------------------------------------------------------------------
