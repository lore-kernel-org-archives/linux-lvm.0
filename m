Message-ID: <20031219103018.636.qmail@web13504.mail.yahoo.com>
From: Stuart Felenstein <stuart4m@yahoo.com>
In-Reply-To: <20031219110923.E18654@sistina.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="0-564124173-1071829818=:165"
Subject: [linux-lvm] Question: Fstab
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
Date: Fri Dec 19 08:18:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--0-564124173-1071829818=:165
Content-Type: text/plain; charset=us-ascii


After reading the docs and searching the archives I'm still a bit confusied on the issue of how to mount the logical volume I've created, upon bootup.

I can use the mount command and that seems to work fine.  vgscan detects it on boot.

Currently (and I've just really set up the system) is to issue

mount -t ext3 /dev/video_stor/logvol1 /mnt

then I can cd to /dev/video_stor

while I'm posting here in the dev/video_stor directory I see group and logvol1

Thanks

Stuart


--0-564124173-1071829818=:165
Content-Type: text/html; charset=us-ascii

<DIV>
<BLOCKQUOTE class=replbq style="PADDING-LEFT: 5px; MARGIN-LEFT: 5px; BORDER-LEFT: #1010ff 2px solid">
<P>After reading the docs and searching the archives I'm still a bit confusied on the issue of how to mount the logical volume I've created, upon bootup.</P>
<P>I can use the mount command and that seems to work fine.&nbsp; vgscan detects it on boot.</P>
<P>Currently (and I've just really set up the system) is to issue</P>
<P>mount -t ext3 /dev/video_stor/logvol1 /mnt</P>
<P>then I can cd to /dev/video_stor</P>
<P>while I'm posting here in the dev/video_stor directory I see group and logvol1</P>
<P>Thanks</P>
<P>Stuart</P></BLOCKQUOTE></DIV>
--0-564124173-1071829818=:165--
