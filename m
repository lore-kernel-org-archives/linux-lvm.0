From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Is is possible to have "boot" and "/" in LVM on top of SW RAID5?
Message-ID: <20021121072209.GA20206@percy.comedia.it>
References: <200211210441.48883.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200211210441.48883.Dieter.Nuetzel@hamburg.de>
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
Date: Thu Nov 21 01:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

you cannot have /boot on top of sw raid 5. fullstop.
create a 4-way mirror + spare at the beginning of each device
and use the rest for raid5+spare use the first raid1 for /boot and the
rest for lvm.
i have been using this setup without any problem for about 2 years.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
