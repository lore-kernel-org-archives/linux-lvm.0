From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm/devfs bug?
Message-ID: <20030409072130.GD1366@tykepenguin.com>
References: <1049829705.2312.16.camel@rich> <20030408204334.GD22951@percy.comedia.it> <1049836943.7411.19.camel@rich>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1049836943.7411.19.camel@rich>
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
Date: Wed Apr  9 02:21:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 08, 2003 at 02:22:23PM -0700, Rich Turner wrote:
> even though devfs is compiled in the kernel it actually is not mounted
> at this time. i have tried it using devfs long names also with no
> success.

If devfs is in the kernel you MUST have it mounted for LVM. It's to do with the
interaction between /proc/partitions and LVM.



patrick
