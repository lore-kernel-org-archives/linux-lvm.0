Return-Path: <ahiam@hotmail.com>
From: "Arindam Haldar" <ahiam@hotmail.com>
Date: Tue, 17 Jul 2001 06:20:34 +0530
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-ID: <OE52FqgyThYTrRviCij00004c76@hotmail.com>
Subject: [linux-lvm] Strtup probs !
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

hi all,

i need help with the following probs 'm facing.....
my system is--->  512MB, 500Mhz, 3 scsi, Compaq server with 7.0 Slackware
upgradded packages with latest from Slackware & kernel 2.4.6 ( with LVM as
module)
1) could not start LVM with /etc/fstab entries !   ;-(
    i have created initrd.gz & have done exactly as stated in HOW-TO to
start LVM at startup ( i'm doing it only on my /home ).
    if i dont put entries on my /etc/fstab ( for home & LVM) then it works
ok, but sooner i put it there on boot there is an error of  something swap
disk which takes me to administrative mode !!!!.. my /etc/fstab enrty is
/dev/VGmail/LVmail    /home    ext2    defaults    1    1

2) can quota be implimented with LVM  for eg on my /home .. ??

3) how to have root partion on LVM.
    i tried to do that too like in the HOW-TO & did dd on an empty partion.
but when i tried to convert root partion to LVM  i got errors.. so can
anyone tell me the actual steps pls !

pls excuse me for my english
thanxs in advance...
arindam haldar
