Message-ID: <20010823232349.9882.qmail@web20306.mail.yahoo.com>
Date: Thu, 23 Aug 2001 16:23:49 -0700 (PDT)
From: Brad Langhorst <bwlang@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] extending striped lv
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I read in the Howto that it is not possible to add a
disk to a striped LV.  I assume this is being worked
on - is that correct? 

What about extending an LV with free space on the same
VG? 

I've got a 2PVs in one VG and I'm planning to make an
LV that is not the whole size of the VG with the
intention of extending it later or adding a second LV
for a different purpose.  I'd like to enable striping
to realize a performance increase but only if I can
extend the LV later.

thanks!

brad



__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
