From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Best way to create a 540GB LVM Volume?
Message-ID: <20020624191615.GD19554@auctionwatch.com>
References: <1024945627.6892.7.camel@UberGeek>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1024945627.6892.7.camel@UberGeek>
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
Date: Mon Jun 24 14:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jun 24, 2002 at 12:07:07PM -0700, Austin Gonyou wrote:
> I've got 14 FC1 disks in a PV660F. I want to take 7 of them and make a
> large volume. I can't seem to make a > 450 GB volume though, even though
> lvdisplay is showing xxMB PE free. 
> I'm using default 4mb and also 8mb extentsize when creating the VG.
> Please advise.

    vgcreate -s8m doesn't work? 

    Did for me. 

-- 
time since last cigarette: 63d, 9h, 48m
time since last dose of Nicotine: 18d, 15h, 55m 
This is not a .signature file.
