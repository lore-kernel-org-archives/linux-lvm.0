Message-ID: <001c01c168a3$9b172db0$0222a8c0@tux>
From: "Philipp" <plasma@pealpjpain.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Recovery of a damaged striped volume
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
Date: Thu Nov  8 16:43:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello Folks!

My system consists of two brand new IBM Deskstar HDs with 60 GB each,
connected to a Promise Ultra100 card, the rest of the system doesn't matter
so far ... these two discs are joined together in a striped volume group.

I've got in some trouble: This week I wanted to reinstall the basic linux
system. During this process I noticed some mysterious behaviour of one of
the system discs, and so decided to check and clean that disc with the IBM
'Drive Fitness Test' program. But the darn thing ignored my choice and
whiped out the first few sectors of one of the data discs.

The question: is it possible to restore the striped volume? Or more
detailed: if I simply repeat the same steps I did when I build up the volume
(write partition table, create pv's and vg, ...) so that the data on the
discs is left untouched, will my ReiserFS on that volume be able to restore
itself? Or is all the data on the discs  when I initialize them as 'physical
volume'?

Many thanks in advance, and please someone help me out of that ... because
I've got no backups so far :-(

Greetings >>>> Philipp
