From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Any tools to read vgcfgbackup config ?
Message-ID: <20030409135505.GG1943@fib011235813.fsnet.co.uk>
References: <5F51EB83DC94D211827A0008C75DE6B40705AE25@alrh41.bc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5F51EB83DC94D211827A0008C75DE6B40705AE25@alrh41.bc>
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
Date: Wed Apr  9 08:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 09, 2003 at 02:59:05PM +0200, GONAY Benjamin (ANS/AXS) wrote:
> 
>  Hi all,
> 
>  I'm using LVM 1.0.5(mp-V6) with SuSE8.1, all is fine. 
>  I'm thinking about a future crash of my lvm config (just hoping this will
> never happens..) and telling me :
> 
>    how could i known the configuration saved in the vgxxx.conf files
> (results of the vgcfgbackup command) ??
> 
>  Is there any tool to display the saved config in theses files ?

If you're really worried about this you may want to consider upgrading
to LVM2, where the backup files are in a human readable format.
Alternatively you could just use the LVM2 tools to take a backup of
the LVM1 metadata areas on disk (the tools wont look at the LVM1 backups).

- Joe
