From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Is lvmcreate_initrd expected to work?
Message-ID: <20011128125053.A6862@golem.blacknet.de>
References: <3C041A0D.70608@larsshack.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3C041A0D.70608@larsshack.org>; from lars@larsshack.org on Tue, Nov 27, 2001 at 05:56:13PM -0500
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
Date: Wed Nov 28 05:49:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 27 '01 at 17:56, Lars Kellogg-Stedman wrote:
> I ended up custom building an initrd around busybox, which provides a 
> flexible pre-boot environment, including access to a shell prompt from 
> within the initrd (which proved extremely useful recently).  But 
> obviously, not everybody is going to have the time or experience to do this.
Could you share some details about your cusrom initrd setup?

I tried to do the same, but always have problmes with 
- executing a shell
- continuing boot afterwards

Thanks,
    Goetz.
