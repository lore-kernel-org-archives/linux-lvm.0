From: Theo Van Dinter <felicity@kluge.net>
Subject: Re: [linux-lvm] LVM System
Message-Id: <20020304170002.J18939@kluge.net>
References: <auto-000021223409@front2.mail.megapathdsl.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <auto-000021223409@front2.mail.megapathdsl.net>;
    from anthony@AWMObjects.com on Mon, Mar 04, 2002 at 04:39:10PM -0500
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
Date: Mon Mar  4 16:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 04, 2002 at 04:39:10PM -0500, Anthony W. Marino wrote:
> Any thoughts or articles that would be usefull in determining the quality 
> on the following combination would be greatly appreciated:
> 
> LVM 1.x
> 3Ware 7800 Raid Controller
> Maxtor 40GB harddrives
> XFS Journalling FS
> SuSE 2.4.18+ Linux

My only comment is that my new setup (specs below) has worked nicely on a
production machine for about a month now.

LVM 1.0.1-rc4
3Ware 7410 RAID Controller
2x IBM 60GB hard drives
XFS Filesystem
RedHat 7.2

-- 
Randomly Generated Tagline:
#define NULL 0           /* silly thing is, we don't even use this */
              -- Larry Wall in perl.c from the perl source code
