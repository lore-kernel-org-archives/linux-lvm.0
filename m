Date: Fri, 10 Dec 1999 12:16:00 +0100
From: Fabian Herschel <Fabian.Herschel@suse.de>
Subject: [linux-lvm] How to list partitions, which have the LVMs part. type
Message-ID: <19991210121600.A1098@suse.de>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

Only a very simple solution to list partitions, which can be used
for lvm:

 fdisk -l | awk '$5 ~ /8[Ee]/ { print $1 }' 

Greetings 
Fabian Herschel
-- 
-----------------------------------------------------------------------
Fabian Herschel                                 SuSE Rhein/Main AG     
Tel:    +49-6196-50951-23                       Mergenthalerallee 45-47
Fax:    +49-6196-409-607                        D-65760 Eschborn
mailto: Fabian.Herschel@suse.de                 http://www.suse.de      
