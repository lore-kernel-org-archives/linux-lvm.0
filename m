Message-ID: <3F329362.9040203@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] PV Move
References: <001d01c35d0a$971333a0$0d01a8c0@aphrodite>
In-Reply-To: <001d01c35d0a$971333a0$0d01a8c0@aphrodite>
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
Date: Thu Aug  7 13:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

Rupert Hair wrote:
> So my question is really can I change where LVM is expecting to find a
> PV?

everywhere! just put the new disk on any free IDE port you have.
Or use some temporary IDE pci-card. After you extracted the old
disk from your lvm (don't forget the final vgremove), you may
swap all disk around as you like. LVM will find them, regardless
to which devices they are connected. This is one of the most impressive
features of LVM anyway!

May be hda can not be moved that easily because of the MBR to boot fom.
But that has nothing to do with LVM.

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
