Message-ID: <3F2A4A76.9070003@conterra.de>
From: Dieter Stueken <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvmove and badsectors
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
Date: Fri Aug  1 06:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@sistina.com

Heinz J . Mauelshagen wrote:
> pvmove moves data chunk by chunk (64kB).
> 
> If such chunk read fails, it retries rereading the failed chunk sector
> by sector in order to retrieve as much data as possible.

I'm about to try it. But afterwards I like to analyze which files
are affected using "debugfs". As far as I understand the code, any
unreadable sector is zeroed. The printf reports about the unreadable
sector, but only prints the # of the sector from the input device.
Instead I'm interested on where the zeroed sector ends up on the
destionation device, to locate it later on. Questions:

the printed sector number counts 512 byte sectors?
If I run pvmove -v, it reports the PE# and LE# of the
PE currently copying. I hope I can calculate this way:

Get sector# modulo PE size to get the relative position
of the broken sector within the PE, and using the destionation
LE# + the offset to get the sector # on the LV after the
move. Right?

Suggestion:
write such informations to syslog to be sure this is
saved somewhere. If this is printed on screen olny, I may loose
this information easily and won't have any change to locate the
broken sector later on.

Dieter.
-- 
Dieter St�ken, con terra GmbH, M�nster
     stueken@conterra.de
     http://www.conterra.de/
     (0)251-7474-501
