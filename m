From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Trouble with pvmove
Message-ID: <20030503114458.GB541@guldukat>
References: <001401c31014$efdcc840$0100a8c0@andre6xtbp6uza>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <001401c31014$efdcc840$0100a8c0@andre6xtbp6uza>
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
Date: Sat May  3 05:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thu, 01.05.03, Andre� �str�m <andree.astrom@home.se> wrote:

> In one of my volume groups a disk have gone bad.
> I extended the volumegroup with another disk to be able to pvmove it.

Is the disk already producing read errors or are you using a SMART monitor
that tells you it is bad?

> 
> pvmove -i -v /dev/hdh
> 
> It went fine until,
> pvmove -- /dev/hdh [PE 259 [archive [LE 259]] -> /dev/hdj [PE 259]
> [260/1831]
> 
> The machine got total dead. The whole volumegroup consists of 1.1TB so i
> couldn't backup it all up beforehand.

Which version of LVM are you using? IIRC there has been trouble with pvmove
and lockups before, so try to upgrade to newest version.

cya,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <
