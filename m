From: Steven Lembark <lembark@wrkhors.com>
Subject: Re: [linux-lvm] lvmcreate_initrd failing...not sure why
Message-ID: <617990000.1041459011@[192.168.200.4]>
In-Reply-To: <se12cfa5.015@thpmail.tyndale.com>
References: <se12cfa5.015@thpmail.tyndale.com>
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
Date: Wed Jan  1 16:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com


-- Cameron Thorne <CLT@tyndale.com>

> I am trying to convert my root file system over to LVM

Don't. All you do is make it difficult to recover from LVM
problems. If you mount the major filesystems (including
/usr and /var) as LV's / only needs to be around 80MB
for /bin, /lib, /etc, and /boot. For the minimal amount
of space you use, why bother with it?




--
Steven Lembark                               2930 W. Palmer
Workhorse Computing                       Chicago, IL 60647
                                            +1 8773 252 1080
