From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] Is is possible to have "boot" and "/" in LVM on top
 of SW RAID5?
Message-ID: <355870000.1037863997@[192.168.200.4]>
In-Reply-To: <20021121072209.GA20206@percy.comedia.it>
References: <200211210441.48883.Dieter.Nuetzel@hamburg.de>
 <20021121072209.GA20206@percy.comedia.it>
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
Date: Thu Nov 21 01:28:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Luca Berra <bluca@comedia.it>

> you cannot have /boot on top of sw raid 5. fullstop.
> create a 4-way mirror + spare at the beginning of each device
> and use the rest for raid5+spare use the first raid1 for /boot and the
> rest for lvm.
> i have been using this setup without any problem for about 2 years.

I use a similar setup, with separate copies of the root
volume (which includes /boot). Only advantage to this is
having /lvm, /etc, and /bin available if there are problems.
The root volume can be small -- 80 MB works in most cases
since /usr, /home & /var will be mount points.


--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 800 762 1582
