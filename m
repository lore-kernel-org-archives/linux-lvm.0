Message-ID: <3F30B9C1.4050400@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How long does PVmove take
References: <200308051754.13652.bjzolp@wisc.edu> <20030805225849.GF7336@questra.com> <200308051823.30514.bjzolp@wisc.edu>
In-Reply-To: <200308051823.30514.bjzolp@wisc.edu>
Content-Transfer-Encoding: 8bit
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
Date: Wed Aug  6 03:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

B. J. Zolp wrote:
> Its been at 80-98% cpu the whole time too.  I have a feeling
> something is wrong.

Have a look at the device settings by "hdparm /dev/hdx" to see, if
DMA was disabled. If it was turned off, you should also have a look
into your syslog for IDE bad sector errors occurred. If so, the linux
IDE driver will switch off DMA immediately, as some years ago, buggy IDE
controller caused this kind of problem. Nowerdays this cause of errors
became quite unlikely. Instead it most likely there is (or was) really
some bad sector on your disk, and the error has nothing to do with the
use of DMA mode (but may cause further problem for pvmove).

Summary: swich on dma mode again (hdparm -d 1...). If you don't have
some very aged PII board you may even tell the driver, not to swich
off DMA for each error "hdparm -k 1..". But you should watch out for
any disk erros very carefully, and use some diagnostic tools to monitor
your disks, i.E. http://smartmontools.sourceforge.net/

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
