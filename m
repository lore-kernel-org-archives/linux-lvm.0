Return-Path: <jeffrey.b.layton@lmco.com>
Date: Fri, 20 Apr 2001 11:47:46 -0400
From: Jeffrey B Layton <jeffrey.b.layton@lmco.com>
Subject: Re: [linux-lvm] LVM and DRDB
Message-id: <3AE05A22.6305B727@lmco.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
References: <20010420111022.C6133@cistron.nl> <200104201031.f3KAVT05030575@webber.adilger.int>
 <20010420123624.F13067@cistron.nl> <d3y9svheu9.fsf@lxplus015.cern.ch> <20010420154246.R13067@cistron.nl>
 <yq1u23jvbv8.fsf@jaguar.mkp.net>
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
To: linux-lvm@sistina.com

"Martin K. Petersen" wrote:

> >>>>> "Wichert" == Wichert Akkerman <wichert@cistron.nl> writes:
>
> Wichert> Previously Jes Sorensen wrote:
> >> For a file system that size you might want to look at XFS instead.
>
> Wichert> How stable is XFS compared to ext3 and reiserfs? For this
> Wichert> system minimum downtime is very important..
>
> I mkfs.xfs'ed the / and /home filesystems on my primary workstation on
> September 7th last year.

What happens with I/O loads? (I've heard that XFS dies a
nasty death - but that was early this year).

Thanks,

Jeff Layton


>
>
> 'nuff said... :)
>
> --
> Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
> mkp@linuxcare.com, http://www.linuxcare.com/
> SGI XFS for Linux Developer, http://oss.sgi.com/projects/xfs/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
