Date: Wed, 20 Mar 2013 10:55:19 -0400
From: David Teigland <teigland@redhat.com>
Message-ID: <20130320145519.GB4759@redhat.com>
References: <CAHkw+LfrqkbZ8GUnEfz8umL22NJHep0xTmYkQ3wb-gr3rSFNhA@mail.gmail.com>
	<20130320103836.58451646@jajo.eggsoft>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130320103836.58451646@jajo.eggsoft>
Subject: Re: [linux-lvm] Error Attempting to Create LV on Clustered VG
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marc Smith <marc.smith@mcc.edu>
Cc: linux-lvm@redhat.com

> > I've Google'd around a bit but haven't found any other posts quite
> > like this one. Here are the software versions I'm using on these
> > hosts:
> > Linux kernel: 3.7.8
> > LVM2: 2.02.97
> > DLM User Tools (dlm_controld): 4.0.1
> > Corosync: 2.3.0
> > Pacemaker: 1.1.8
> 
> Are you using a 64-bit environment. If so, then this might be the bug in the
> 3.7 kernel DLM driver.
> 
> http://www.redhat.com/archives/cluster-devel/2013-February/msg00060.html
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=d4b0bcf32b946590afd29e202d6a399b84fe6c67

The fix is in the 3.8 kernel.

> > When I attempt to create a LV on this VG from one of the hosts, I get
> > the following error message:
> > [root@ben ~]# lvcreate -L 150G -n testvmfs1 r0
> >   Error locking on node 40e6640a: Invalid argument
> >   Error locking on node 31e6640a: Invalid argument
> >   Failed to activate new LV.

I'd also advise setting up proper node definitions in corosync.conf;
it avoids the invalid nodeid issue and makes everything cleaner.
Here's what I use:

totem {
        version: 2
        secauth: off
        cluster_name: foo
}

nodelist {
        node {
                ring0_addr: 1.1.1.1
                nodeid: 1
        }
        node {
                ring0_addr: 2.2.2.2
                nodeid: 2
        }
}

quorum {
        provider: corosync_votequorum
        two_node: 1
}                                                                               

logging {
        to_syslog: yes
}
