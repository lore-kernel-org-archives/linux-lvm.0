Received: from fentible.pjc.net (vpnuser1.surrey.redhat.com [172.16.9.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i6L6jlhp000645
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 07:45:47 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1BnArM-0004br-85
	for linux-lvm@redhat.com; Wed, 21 Jul 2004 07:45:48 +0100
Date: Wed, 21 Jul 2004 07:45:48 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] scripts/clvmd_fix_conf.sh
Message-ID: <20040721064547.GA17348@tykepenguin.com>
References: <5.1.0.14.2.20040720145206.038b4008@pop.ncsa.uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5.1.0.14.2.20040720145206.038b4008@pop.ncsa.uiuc.edu>
Sender: Patrick <patrick@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 20, 2004 at 02:57:39PM -0500, Guochun Shi wrote:
> hi,
> 
> in this script line 47-48
> SCRIPTFILE=`mktemp -t lvmscript.XXXXXXXXXX`
> TMPFILE=`mktemp -t lvmtmp.XXXXXXXXXX`
> 
> but mktemp does not have -t option. It complains when I run the script
> 
> [LVM2]#  scripts/clvmd_fix_conf.sh  /lib
> mktemp: invalid option -- t
> Usage: mktemp [-d] [-q] [-u] template
> mktemp: invalid option -- t
> Usage: mktemp [-d] [-q] [-u] template
> scripts/clvmd_fix_conf.sh: line 127: $SCRIPTFILE: ambiguous redirect
> scripts/clvmd_fix_conf.sh: line 128: $TMPFILE: ambiguous redirect
> sed failed, /etc/lvm/lvm.conf not updated
> 

Maybe you have an older version of mktemp. Just remove the -t switch. It's only
in there to make it honour varibales like TMPDIR.
-- 

patrick
