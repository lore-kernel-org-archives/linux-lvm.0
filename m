From: "MrNatcho" <mrnatcho@gmx.net>
In-Reply-To: <20030123123658.B30188@sistina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgscan fails after more or less successful pvmove
Message-Id: <E18blHk-0003g1-00@hermes.sistina.com>
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
Date: Thu Jan 23 11:38:01 2003
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

Heinz,

thanks for the reply.

Looks like I messed that one up. I didn't think of putting down the errors in the first place as the LV was still 
accessible after I unsuccessfully tried to free up the first PV. I didn't expect to get any problems when the 
next pvmove's failed so I just went on trying.

At least I learned from that, even when that was the hard way.

I'll go and see if I was smart enough to backup the correct files from that machine...

Thanks anyway,
Stefan

On Thu, 23 Jan 2003 12:36:58 +0100, Heinz J . Mauelshagen wrote:

>
>Stefan,
>
>you say that you didn't put the error down pvmove displayed in the first place.
>
>No chance for us to tell you the reason of the failure that way, sorry.
>Could be a hardware flaw or a pvmove bug. I don't know.
>
>You continued to change your LVM config _after_ that first failure happened,
>which is bad.
>
>That was 'Full stop. Ask first'-time.
>
>At that point you still had the chance to restore your metadata backup
>to unfail your VG.
>
>After so many changes there's no chance any more I am afraid.
>
>Sorry, it is time for reaching out to the backup media.
>Hopefully you have recent ones as recommended in the pvmove manual page.
>
>Regards,
>Heinz    -- The LVM Guy --
>
