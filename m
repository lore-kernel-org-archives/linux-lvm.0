Return-Path: <dmeyer@dmeyer.net>
Date: Sun, 14 Jan 2001 21:28:50 -0500
From: dmeyer@dmeyer.net
Message-ID: <20010114212850.A9102@yendi.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Re: vgcfgrestore bug followup
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

On Sun, 07 Jan 2001 16:23:50 -0500,  Brad Corsello wrote:
> Following up on my own post, I seem to have solved my problem by
> editing the vg data in the first physical volume with a hex editor,
> adding the uuid of the second PV where it was supposed to be.  Once
> I did that, vgscan ran successfully and found the volume group.  But
> I think this just proves vgcfgrestore is not restoring the uuid list
> to disk properly.

Could you describe what you had to do in detail?  I just had a similar
problem to what you described, but am quite new to LVM.

Also, please cc: me at meyer@virtc.com since my main mail machine is
down with, well, serious LVM problems. :-(.  Thanks.

     Dave
