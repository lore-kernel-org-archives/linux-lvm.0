From: Patrick Caulfield <caulfield@sistina.com>
Message-ID: <20030620183316.GB20393@tykepenguin.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline
Subject: [linux-lvm] [lvm setup problems]
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
Date: Mon Jun 23 08:10:06 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: message/rfc822
Content-Disposition: inline

X-Mail-Format-Warning: Bad RFC2822 header formatting in >From patrick  Fri Jun 20 18:50:14 2003
Return-path: <bgeer@linkmail.net>
Envelope-to: patrick@localhost
Delivery-date: Fri, 20 Jun 2003 18:50:14 +0100
Received: from localhost.pjc.net ([127.0.0.1] helo=localhost)
	by arthur.pjc.net with esmtp (Exim 3.36 #1 (Debian))
	id 19TQ1d-0005DH-00
	for <patrick@localhost>; Fri, 20 Jun 2003 18:50:13 +0100
Received: from mail.cix.co.uk
	by localhost with POP3 (fetchmail-5.9.11)
	for patrick@localhost (single-drop); Fri, 20 Jun 2003 18:50:13 +0100 (BST)
Received: from master.debian.org (master.debian.org [146.82.138.7])
	by mta04.mx.cix.co.uk (8.11.3/CIX/8.11.3) with ESMTP id h5KHlxP12152
	for <patrick@tykepenguin.cix.co.uk>; Fri, 20 Jun 2003 18:48:00 +0100
X-Envelope-From: bgeer@linkmail.net
Received: from smtp-1.vancouver.ipapp.com [216.152.192.207] 
	by master.debian.org with esmtp (Exim 3.35 1 (Debian))
	id 19TPzS-0006zR-00; Fri, 20 Jun 2003 12:47:58 -0500
Received: from linkmail.net ([67.209.182.41]) by smtp-1.vancouver.ipapp.com ; Fri, 20 Jun 2003 10:47:54 -0700
Message-ID: <3EF348CE.4030703@linkmail.net>
Date: Fri, 20 Jun 2003 13:47:58 -0400
From: Bob <bgeer@linkmail.net>
User-Agent: Mozilla/5.0 (Windows; U; Win 9x 4.90; en-US; rv:1.0.2) Gecko/20021120 Netscape/7.01 (NSCD7.01)
X-Accept-Language: en-us, en
MIME-Version: 1.0
To: lvm10@packages.debian.org
CC: lvm-common@packages.debian.org
Subject: lvm setup problems
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
X-Country: US
Delivered-To: lvm10@packages.debian.org
X-Envelope-To: patrick@tykepenguin.cix.co.uk
X-Spam-Status: No, hits=-3.7 required=5.0
	tests=BAYES_01,RCVD_IN_NJABL,RCVD_IN_OSIRUSOFT_COM,
	      USER_AGENT_MOZILLA_UA
	version=2.55
X-Spam-Level: 
X-Spam-Checker-Version: SpamAssassin 2.55 (1.174.2.19-2003-05-19-exp)

My system:

CPU: 200MHz Intel Pentium
MLB: AOpen AP53
IDE Drive: 540M Maxtor
SCSI Adapter: Compaq wide ultra scsi (68 pin) (uses ncr53c8xx.o)
SCSI Drives: 2 Compaq (Seagate) 4.5G
              1 Fujitsu 4.5G
              1 Seagate 18G

All of the above hardware is 100% functional and works with this and 
other software. I'm exploring storage management for myself and for a 
friend who runs an internet server farm.

My reference data:

Man Pages
On-line howto from Sistina
various files included in the package

Problems:

1. The howto tells me to alter the command lines described if I'm using 
  "devfs" but doesn't tell me (a novice) how I'd know whether or not I 
have it. In /usr/share/doc/lvm-common/readme.gz I am told how to check 
by inference: it says that a test is made in /etc/init.d/lvm. However, 
there is no test in the script I have.

2. The stock installation tries to install a module "lvm" in 
/etc/modules. Exploring my system there is no "lvm.o" anywhere in the 
/lib tree. Consequently this gives me a modprobe error on every startup. 
I solved this problem by changing the "lvm" line to "lvm-mod" and 
everything seems to work okay. There is a related error in the 
/etc/init.d/lvm script, but it doesn't seem to have any harmful effect. 
Its modprobe output is redirected to /dev/null. I commented it out anyway.

3. This is a strange and hard to discover problem. I played around with 
it for one whole day. Only my faith in the Linux community and Sistina 
kept me after it. The simple explanation is:

--------------------------------------------------------------

fdisk  /dev/sda1
.
.
pvcreate /dev/sda1
..repeat the above for /dev/sd[b-d]1...

             -OR-

dd if=/dev/zero of=/dev/sda1 bs=1K count=1
pvcreate /dev/sd[a-d]

		-THEN-

vgcreate -n vg0 /dev/sd[a-d]1
lvcreate -L 9 -n lv0 vg0
lvcreate -L 20 -n lv1 vg0

		-the following is NOT included in the howto-

vgscan

-----------------------------------------------------------------

All up to the last command ("vgscan") works perfectly and produces 
usable devices. However, if you don't do a "vgscan" before you reboot 
you can "vgscan" to your heart's content and all you'll get is error 
message after error message. The volume group cannot be used because it 
can't be found. If you try to re-create it, THEN it can be found and you 
can't do that either.  Even "lvmchange -R" doesn't remove all traces of 
the volume group(s) created. I used "find / -name vg0" (and variants) to 
hunt them down an kill them in places such as /dev. Also common sense 
made me look in /etc/lvm and the like.

BTW the difference between "pvcreate /dev/sda" and "pvcreate /dev/sda1" 
is not well explained (at least not where it matters.) I think I used 
the  "pvcreate /dev/sda1" version. I can't remember for sure because I'm 
old and my memory isn't as good as it used to be. Guess I'll try both 
ways later.

Not withstanding all of the above and more, the end result was a fine 
storage system and great results. We'll probably use lvm on my friend's 
Red Hat (oops) internet systems too. I hope their lvm layout isn't too 
different from Debian's.

I also hope that this is of some help to you and the Sistina howto 
people. I hate to seem like I'm griping or whining because I'm not. This 
is a genuine attempt to improve an already great product. Assuming you 
got this far, thanks for your time and effort in reading this account.

Sincerely,

Bob Geer


--YiEDa0DAkWCtVeE4--
