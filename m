Message-ID: <1063983675.3f6b1a3bafc23@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
Subject: Re: [linux-lvm] Migrate from LVM1 to LVM2...
References: <1063917231.1786.13.camel@super.gamux.chezmoi> <3F6B0E0F.5080807@webhackande.se> <1063980916.3f6b0f740b738@secure.st-peter.stw.uni-erlangen.de> <3F6B1281.8080300@webhackande.se> <1063982920.3f6b1748a8029@secure.st-peter.stw.uni-erlangen.de> <3F6B186C.9020107@webhackande.se>
In-Reply-To: <3F6B186C.9020107@webhackande.se>
MIME-Version: 1.0
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
Date: Fri Sep 19 10:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Rickard Olsson <richie@webhackande.se>:

> Svetoslav Slavtchev wrote:
> 
> > should this be really bad ?
> 
> It works fine, it's just a pain to type those long paths when doing a 
> pvmove or somesuch operation.
> 
> /dev/ide/host0/bus0/target0/lun0/disc
> 
> vs
> 
> /dev/hda
> 
> Fortunately, the paths are firmly embedded in the character cache in my 
> fingers by now. :-)

hm,
doesn't devfsd create the links ?

i think i had them OK with 2.6.0-test3bk7
on a Mandrake-9.1 with some small updates
( like initscripts, hotplug,devfsd ...)

svetljo
