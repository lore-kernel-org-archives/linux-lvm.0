From: josv@osp.nl
Date: Mon, 24 Sep 2001 14:09:42 +0200
Subject: Re: [linux-lvm] Linux File System
Message-ID: <20010924140942.B1263@gatekeeper.osp.nl>
References: <71B659EFA1EAD311932700508B6460B9017A5204@mailman.isoft.intranet.gr>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <71B659EFA1EAD311932700508B6460B9017A5204@mailman.isoft.intranet.gr>; from antonis.tsipnis@intrasoft.com on Mon, Sep 24, 2001 at 03:06:31PM +0300
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

Hi,

Could you send the output of:

- lvdisplay <your_lv_here>
- df -k <your_mountpoint_here>

++Jos

And thus it came to pass that Tsipnis Antonis  (antonis.tsipnis@intrasoft.com) wrote:
(on Mon, Sep 24, 2001 at 03:06:31PM +0300 to be exact)

> Hi there !
> I have installed the LVM tools on a Mandrake Linux system. After the
> creation of a volume group, and the succesfull creation of a logical volume
> I have tried to add a filesystem within this logical volume. After mounting
> the file system, I have this problem: after I have used half of the file
> system's free space, system reports that file system is full (!) although I
> can see with "df -k" that there is still enough space available. I would
> apreciate any help,
> 
> Antony Tsipnis.
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
We don't see things as they are, we see them as *we* are...
