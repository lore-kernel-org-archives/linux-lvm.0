From: Benjamin Scott <bscott@ntisys.com>
Subject: Re: [linux-lvm] LVM fails at bootup
In-Reply-To: <20011112153013.Q715@sonsofthunder.yi.org>
Message-ID: <Pine.LNX.4.33.0111121541140.13347-100000@dragon.inside.ntisys.com>
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
Date: Mon Nov 12 14:39:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, 12 Nov 2001, Bradley M Alexander wrote:
>> Don't know about this - looks like hardware problems.
>
> I thought so too, but the fact that it only happens when I try to enable
> LVM at bootup makes me think its not.  I had a Debian mirror on this
> drive prior to this, and it never gave me errors, and if I boot without
> LVM and enable it after boot by hand, I don't get these errors.

  Is there anything in your bootscripts which adjusts the IDE driver to use
more conservative settings (usually via "hdparm")?

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |
