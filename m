Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iB66kXr05239
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 01:46:33 -0500
Received: from web54407.mail.yahoo.com (web54407.mail.yahoo.com
	[68.142.225.163])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id iB66kVmo019307
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2004 01:46:31 -0500
Message-ID: <20041206064620.42453.qmail@web54407.mail.yahoo.com>
Date: Sun, 5 Dec 2004 22:46:20 -0800 (PST)
From: Gwen Morse <renniefan@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Newbie questions about LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
while I'm not able to really answer your question (I'm
not that LVM
knowledgeable), but you are lacking some bit of
crucial information:

On Thu, 2004-12-02 at 18:12 -0800, Gwen Morse wrote:
> However, that looks like it mostly deals with a
single
> hard drive being copied to another single hard
drive.
> We have a raid array, which looks like it's covered
> more under this:
>
http://www.tldp.org/HOWTO/LVM-HOWTO/recipemovevgtonewsys.html

There is a big difference if this array is hardware or
software based.
If you can provide that piece of information, people
will be able to
help you better.

~David

The situation (as I think it is) is that mail server
is on a hardware RAID system formatted with LVM, but,
the question I've been sent to answer is whether it's
possible to connect that hardware RAID sub-system to
another hardware RAID sub-system, using a _software_
RAID 1 (mirror), and have that software RAID be stable
enough to allow the two systems to to function,
_while_ the mail server is...uuhhh...serving mail :).

Soooo...

Old Mail server (Hardware RAID w/LVM) ==> Software
RAID 1 mirror  == > New Mail Server (empty hardware
RAID)

What is wanted is to take the mail server offline long
enough to set up the software mirror, but, put it back
online while the copying/synching is going on, so that
we don't lose server access during that time.

Gwen




		
__________________________________ 
Do you Yahoo!? 
Read only the mail you want - Yahoo! Mail SpamGuard. 
http://promotions.yahoo.com/new_mail 
