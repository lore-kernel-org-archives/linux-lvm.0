From: Micah Anderson <micah@riseup.net>
Subject: Re: [linux-lvm] Re: RAID 1 on Device Mapper - best practices?
Message-ID: <20031121190031.GQ10912@riseup.net>
References: <200311191103.57697.gregory@castandcrew.com> <yw1xr803yxiw.fsf@kth.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <yw1xr803yxiw.fsf@kth.se>
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
Date: Fri Nov 21 13:02:05 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

The md code decided it was going to resync the mirror
> at between 100KB/sec and 100000KB/sec. The actual rate was 100KB/sec,
> while the device was otherwise idle. By increasing
> /proc/.../speed_limit_min, I was able to crank the resync rate up to
> 20MB/sec, which is slightly more reasonable but still short of the
> ~60MB/sec this RAID is capable of.


On Thu, 20 Nov 2003, M?ns Rullg?rd wrote:


> > Sure, it might suck the living daylights out of system performance,
> 
> It does.

Doesn't have to... With 2.2 kernels, you can simply use 'cat
/proc/sys/dev/md/speed-limit', to see the *minimum* rebuild rate. You
can change it using something like:
'echo 200000 > /proc/sys/dev/md/speed-limit'.

With 2.4 kernels, there are two files in '/proc/sys/dev/raid/', called
'speed_limit_max' and 'speed_limit_min'. I think the rest is pretty
obvious. You don't have to destroy system performance...

micah
