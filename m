Message-ID: <000e01c16aea$1954bd80$0a5c010a@ultra>
From: "Klaus Pedersen" <ultra@mailme.dk>
References: <002e01c161d6$7fa8a960$0a5c010a@ultra> <20011030235208.F800@lynx.no> <005801c161dc$1bbd6160$0a5c010a@ultra> <001501c16305$0e2ab230$0a5c010a@ultra>
Subject: Re: [linux-lvm] Re: After power outtage my vg is gone
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sun Nov 11 13:47:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>
> vgscan -a y (to activate the vg)

Duh - this is an error (I know cause the same problems occured - again :P)
.. the command _should_ have said :

vgchange -a y

so the sequence of commands is :

vgcfgrestore -n site_vg /dev/hdb1
vgcfgrestore -n site_vg /dev/hda8
vgchange -a y
mount /glftpd/site

That's it - I hope others can benefit from this too.

/Klaus
