From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] device-mapper ioctl cmd 2 failed: Invalid argument
Message-ID: <20030923131147.P2155@uk.sistina.com>
References: <20030920185757.A9590@copilotconsulting.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030920185757.A9590@copilotconsulting.com>; from treed@copilotconsulting.com on Sat, Sep 20, 2003 at 06:57:57PM -0700
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
Date: Tue Sep 23 07:12:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Sep 20, 2003 at 06:57:57PM -0700, Tracy R Reed wrote:
> I think I've got the latest everything:
> home:~# lvdisplay --version
>   Driver version:  1.0.6
 
> I've got the latest 2.6, the latest devmapper, the latest lvm userland
> tools from sistina... But snaps still don't work.

Firstly, there's some versioning mix-up here, because the driver
in the 2.6 kernels is not 1.0.6.
 
Secondly, snapshots are not available under 2.6 yet, though the
implementation work is well-advanced.

Alasdair
-- 
agk@uk.sistina.com
