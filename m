From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] IO issue causing unkillable processes.
Message-ID: <20011105130120.D25559@sistina.com>
References: <85063BBE668FD411944400D0B744267A8886B0@AUSMAIL>
Mime-Version: 1.0
In-Reply-To: <85063BBE668FD411944400D0B744267A8886B0@AUSMAIL>; from austin@coremetrics.com on Tue, Oct 30, 2001 at 02:24:03PM -0600
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
Date: Mon Nov  5 06:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Austin,

no problem on ext2 in an LV.
Probaly just a particular load related problem in your SW/HW config.

On Tue, Oct 30, 2001 at 02:24:03PM -0600, Gonyou, Austin wrote:
> This perl script: #!/usr/bin/perl -w
> 
> $|=1;
> open(FD, ">>spew.out");
> while (true) {
> print FD "asdklfasd;kfjsad;kfjs;dlj
> a;sdlkfnas,nfp9ibvp98ay085hq325l;mndfg'adfa
> 'sd;lmf,m/,sd\fasdfna.,mdnf.m,ansdflkjanfoiuahsel;kjrqwe\as\df]adfh\||PPOt'r
> q[tjwq.,mnt/><ZXDNF{OLPIAHSEMN>M<Nl;kjahestlkjahsdklfmsd;lifqpownj;n;lakfn;K
> H;LKH;LKGJAPSOIJ"
> }
> close FD;
> will cause an unkillable process under the proper circumstances. I'm not
> sure what they are, so...
> if anyone who's NOT running xfs, rather Reiser or ext3 or ext2, and LVM,
> could run this and let me know if they experience similar symptoms. I'm not
> sure where the culprit is right now.(whether it's SMP, SCSI, or IDE, the VM,
> whatever.) I'd greatly appreciate your help.
> 
> -- 
> Austin Gonyou
> Systems Architect, CCNA
> Coremetrics, Inc.
> Phone: 512-796-9023
> email: austin@coremetrics.com 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
