Message-ID: <3F6B186C.9020107@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Migrate from LVM1 to LVM2...
References: <1063917231.1786.13.camel@super.gamux.chezmoi> <3F6B0E0F.5080807@webhackande.se> <1063980916.3f6b0f740b738@secure.st-peter.stw.uni-erlangen.de> <3F6B1281.8080300@webhackande.se> <1063982920.3f6b1748a8029@secure.st-peter.stw.uni-erlangen.de>
In-Reply-To: <1063982920.3f6b1748a8029@secure.st-peter.stw.uni-erlangen.de>
Content-Transfer-Encoding: 7bit
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
Date: Fri Sep 19 09:54:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Svetoslav Slavtchev wrote:

> should this be really bad ?

It works fine, it's just a pain to type those long paths when doing a 
pvmove or somesuch operation.

/dev/ide/host0/bus0/target0/lun0/disc

vs

/dev/hda

Fortunately, the paths are firmly embedded in the character cache in my 
fingers by now. :-)

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
