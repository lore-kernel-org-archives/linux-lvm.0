From: Sven Falk <sven@bailong.de>
Message-ID: <20030128171716.GA12391@zeus.bailong.de>
References: <20030127182006.GA6523@zeus.bailong.de> <20030128115025.B17531@sistina.com> <20030128122147.GA10180@zeus.bailong.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030128122147.GA10180@zeus.bailong.de>
Subject: Re: [linux-lvm] recover LVM system
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
Date: Tue Jan 28 11:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Heinz!

On Tue, 28 Jan 2003, Sven Falk wrote:

> On Tue, 28 Jan 2003, Heinz J . Mauelshagen wrote:
> 
> > you've got no LVM prblem but rather a filesystem one unless
> > direct access to the LV fails
> > (i.e. "dd if=/dev/system/data of=/dev/null bs=1k count=1024").
> 
> zeus:/home/bailong # dd if=/dev/system/data of=/dev/null bs=1k
> count=1024
> 1024+0 records in
> 1024+0 records out
> zeus:/home/bailong #

Got it. Finally I was able to fix the problem, I didn't understand
that I have to use /dev/system/data for the fsck, after running e2fsck
on the LVM he recovered all data. I'm happy ;-)))

Thanks for your help Heinz

Cheers
Sven
