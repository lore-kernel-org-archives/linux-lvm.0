Message-ID: <615A249B783CD41192F400D0B747AC8608982673@hesse.bbn.hp.com>
From: "ZECHA,HOLGER (HP-Germany,ex1)" <holger_zecha@hp.com>
Subject: RE: [linux-lvm] lvcreate distributed extent option
MIME-Version: 1.0
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
Date: Sat Nov 30 14:10:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

Hello,

to clarify why we need this setup:
this is the setup for the oracle directory where the datafiles and
indexfiles are located.
we don't setup dedicated filesystem for data and indexfiles and we don't use
raw devices. We mix everything in one directory which is setup up with the
distributed option from HP-UX LVM on HP-UX. With this setup extents are
distributed accross all LUN's and therefore disk IO is also distributed
across all LUN's and administration of this setup i quit easier the using
dedicated filesystems for datafiles and index files.
We want to do this in the same way on Linux, therfore my question.

I wrote a shell script which does excatly this distribution for Linux.

Holger
