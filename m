From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] lvm and md
Message-ID: <20030320100258.GA19767@gw.silicide.dk>
References: <003601c2eec4$386d8ee0$c70aa8c0@RD.proware.com.tw>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <003601c2eec4$386d8ee0$c70aa8c0@RD.proware.com.tw>
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
Date: Thu Mar 20 04:04:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Mar 20, 2003 at 05:36:44PM +0800, Rocky Lee wrote:
> Dear all
>  
>  I have another question with LVM + MD.
>  
>  After I made a LVM on top of MD.
>  
>  If I lost the raidtab file and reboot  
>  can MD and LVM automatic recognize them ?
>  
> or 
> If I change those disks to other machine and boot .
> can new system recognize them without original raidtab file?

Did you use the trick by changing the partitions to linux raid
autodetect ?

To my knowledge most of your questions are answered in the
howto's. See 
www.tldp.org
for software raid howto, and LVM howto



JonB
