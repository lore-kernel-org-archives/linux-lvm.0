From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] LVM1 compat support in 2.6.0-test11 misses one of my 2.4.23 VGs
Message-ID: <20031201014229.N16901@uk.sistina.com>
References: <20031129185055.74160.qmail@web40612.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031129185055.74160.qmail@web40612.mail.yahoo.com>; from rankincj@yahoo.com on Sat, Nov 29, 2003 at 06:50:55PM +0000
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
Date: Sun Nov 30 19:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 29, 2003 at 06:50:55PM +0000, Chris Rankin wrote:
> The tools (vgscan, vgchange -ay) complain
> about finding a "duplicate" PV on /dev/hda2, and say
> that they will ignore it. Natually, I have *not*
> mounted either filesystem under 2.6 yet!

Chris sent me his metadata and I reproduced the problem.

> uuid:         syst-em
> uuid:         user
 
Only the last bit of the UUID gets displayed here.
Actually invalid UUIDs > 32 chars long, and the first 32 chars of each
are identical => duplicate PV.

I've done a patch which uses the last 32 chars as the UUID in
these cases.

Alasdair
