Return-Path: <lembark@wrkhors.com>
Message-ID: <3AFC42EB.2910DAAE@wrkhors.com>
Date: Fri, 11 May 2001 14:52:11 -0500
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 1.0 release decision
References: <20010511155311.A17689@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> In regard to this situation we'ld like to know about your oppinion on
> the following request:
> is it acceptable to release 1.0 soon *before* all patches to reach the 1.0 code
> status are in vanilla (presumed that we provide them with our release as we
> always did before)?
> 
> We'll gather your answers for some days and will send the conclusion
> to the lists.

probably boils down to a marketing issue...

people who already use LVM won't care, we already know how to deal
with this.  new users, however, will feel the pain.  the last thing
we probably want is for first-time users of 1.0 to walk away with a
bad taste from patch/kernel problems.  these people are more likley
to get bit by any patch issues and more likely to either walk away
from LVM or tell other people how much of a hassle it was.  

for my part running the system i'd rather have the "production"
LVM and kernel releases in sync and not have to worry about it.
if i need a beta/inter-version release then i'll deal with the
extra issues.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
