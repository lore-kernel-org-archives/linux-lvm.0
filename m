Subject: Re: [linux-lvm] LVM snap size weirdness...
Mime-Version: 1.0 (Apple Message framework v551)
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B555@mercury.infiniconsys.com>
Message-Id: <D59CB76D-5B12-11D7-91E2-000393CA5730@fib011235813.fsnet.co.uk>
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
Date: Thu Mar 20 14:30:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, March 20, 2003, at 08:00 PM, Barry, Christopher wrote:

> I have dumped an ls of both the snap lv and the home lv and diffed 
> them - no differences.
> Why/how can df be confused?

It's magic ;)  Think of the filesystem that df is looking at as a 
combination of the original volume with some modifications held in the 
snapshot volume.

- Joe
