From: "Herman L. Knief" <herman@knief.net>
In-Reply-To: <3CEA6695.4000100@uci.edu>
Message-ID: <Pine.LNX.4.44.0205210827230.29039-100000@koa.knief.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How do I do RAID 4/5 *and* LVM?
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
Date: Tue May 21 10:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: newman@uci.edu

Yes, create the RAID (MD) device, then layer LVM on top... Now, depeneding
on your requirements, you may not need LVM (do you want/need snapshots,
etc?)

Also, how are you connecting these disks?  How many IDE ports are you
using?  I would recommend against any sort of master/slave setup, as
you'll have difficulties with failure detection and won't get the best
throughput.

 - Herman

On Tue, 21 May 2002, Dave Newman wrote:

->Hi --
->
->I have four 160 GB IDE disks, and wanted to install software RAID 4/5
->*and* LVM, and wanted to ask a couple of brief questions:
->
->a) Do I need LVM if I want to see a single partition (or can RAID do
->this for me)?
->
->b) Do I first install RAID, then LVM?  Are there any difficulties with
->these installs?  (I have already successfully done LVM on its own)
->
->c) Are there any reasons why I shouldn't use both RAID and LVM?
->
->Thanks in advance,
->Dave
->
->
->
->_______________________________________________
->linux-lvm mailing list
->linux-lvm@sistina.com
->http://lists.sistina.com/mailman/listinfo/linux-lvm
->read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
->
