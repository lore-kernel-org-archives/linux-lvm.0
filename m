From: lembark@wrkhors.com
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <26540000.1011646741@duke.wrkhors.com>
In-Reply-To: <20020121224817.B10434@tolppa.smilehouse.com>
References: <12230000.1011638456@duke.wrkhors.com>
    <20020121201314.40293.qmail@web20303.mail.yahoo.com>
    <20020121224817.B10434@tolppa.smilehouse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
Date: Mon Jan 21 15:01:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


-- Harri Haataja <harri.haataja@smilehouse.com> on 01/21/02 22:48:17 +0200

>> lvextend -L +10G /dev/vg1/data 
>> followed by 
>> resize-reiserfs
>> 
>> no corruption (at least not that I've noticed)
> 
> I do this all the time with XFS, Reiser and even ext3.
> At least reiser also shrinks, I think.

The lvextend is almost always safe, extending a mounted
file system can cause real pain if it glitches at all.
There are just too many ways for the system to get fried
if it croaks while someone is both writing a file and the
system is being updated and neither reiser nor ext3 nor
xfs nor lvm at this point seem solid enough to recover
gracefully from heavy duty failures at that point (at
least from what I've seen going by on the mailing lists).


--
Steven Lembark                              2930 W. Palmer
Workhorse Computing                      Chicago, IL 60647
                                           +1 800 762 1582
