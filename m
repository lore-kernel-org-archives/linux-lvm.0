Subject: Re: [linux-lvm] LVM snap size weirdness...
Mime-Version: 1.0 (Apple Message framework v551)
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Content-Transfer-Encoding: 7bit
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB0142B55E@mercury.infiniconsys.com>
Message-Id: <0197B93B-5B79-11D7-91E2-000393CA5730@fib011235813.fsnet.co.uk>
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
Date: Fri Mar 21 02:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

On Thursday, March 20, 2003, at 09:59 PM, Barry, Christopher wrote:

> 	When a backup program grabs files from the snapshot volume, is it 
> subject to open file issues that are normally a problem during > backups?

If are taking a backup from the snapshot, you needed worry about 
applications that have files open on the origin.

- Joe
