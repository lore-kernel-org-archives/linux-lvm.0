From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read hangs when snapshot gets full
Message-ID: <20011211082914.GA1181@tykepenguin.com>
References: <OF4A9F315E.E34E5EC4-ONC1256B1E.00574810@de.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF4A9F315E.E34E5EC4-ONC1256B1E.00574810@de.ibm.com>
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
Date: Tue Dec 11 02:27:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 10, 2001 at 06:18:15PM +0100, Martin Petermann wrote:
> Hi all,
> 
> I'm using a SuSE Linux (V7.2) with a 2.4.4 kernel. If I start a program
> which reads from a snapshot (e.g. cat /dev/vg/snapshot > /tmp/file) with a
> low priority (nice -20), sometimes the program hangs within the
> read() call if the snapshot gets full. If this is the case I'm not able to
> kill the process of the application (even SIGKILL). In my application I
> reduced the number of blocks in each read() call reads and I stop
> reading after the snapshot is full of more then 90%. But this solution is
> not completely avoiding the problem.
> 
> Is there any fix in a newer kernel version?

I think this is fixed in 1.0.1 - it certainly works for me on Linux 2.4.16

patrick
