Return-Path: <mkp@mkp.net>
Subject: Re: [linux-lvm] LVM and DRDB
References: <20010420111022.C6133@cistron.nl>
	<200104201031.f3KAVT05030575@webber.adilger.int>
	<20010420123624.F13067@cistron.nl> <d3y9svheu9.fsf@lxplus015.cern.ch>
	<20010420154246.R13067@cistron.nl> <yq1u23jvbv8.fsf@jaguar.mkp.net>
	<3AE05A22.6305B727@lmco.com>
From: "Martin K. Petersen" <mkp@linuxcare.com>
Date: 20 Apr 2001 12:13:42 -0400
In-Reply-To: <3AE05A22.6305B727@lmco.com>
Message-ID: <yq1lmovv9ah.fsf@jaguar.mkp.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "Jeffrey" == Jeffrey B Layton <jeffrey.b.layton@lmco.com> writes:

Wichert> How stable is XFS compared to ext3 and reiserfs? For this
Wichert> system minimum downtime is very important..
>>
>> I mkfs.xfs'ed the / and /home filesystems on my primary workstation
>> on September 7th last year.

Jeffrey> What happens with I/O loads? (I've heard that XFS dies a
Jeffrey> nasty death - but that was early this year).

We're fine to the extent that 2.4 is fine.  The latter has had a few
rough edges but is getting better.

FWIW, at lot of people are using XFS in production now.  So do check
it out:

        http://oss.sgi.com/projects/xfs/

-- 
Martin K. Petersen, Principal Linux Consultant, Linuxcare, Inc.
mkp@linuxcare.com, http://www.linuxcare.com/
SGI XFS for Linux Developer, http://oss.sgi.com/projects/xfs/
