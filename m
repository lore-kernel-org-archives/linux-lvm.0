Subject: Re: [linux-lvm] RAID & LVM
Message-ID: <1025021781.3d1897559cc46@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
References: <2411209499ABD41180270090274DD8BC0337F1EA@zafnt2>
In-Reply-To: <2411209499ABD41180270090274DD8BC0337F1EA@zafnt2>
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
Date: Tue Jun 25 11:16:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Info - Demerson <demerson@zaffari.com.br>:

> Hullo, All...
> 
> I know it seems to be a very old question, but I can't find in the
> previous
> messages, the answer for that..
> 
you create your raid devices, and then treat them as regular partitons from
which you want to create VG's and LV's, with the difference that you don't need
to change ( i think you cann't) their partition id to lvm ( 8e / 0x8e)

shortly :
mkraid /dev/md0 /dev/md1 /dev/md2 ...
pvcreate /dev/md0 /dev/md1 /dev/md2 ...
vgcreate  myVG /dev/md0 /dev/md1 /dev/md2 ...
....

> Is it possible to use RAID and LVM together?
no problems, a lot of people do use it
> If positive, is there a
> HOW-TO
> telling something about it?
> 
don't think so

good luck

svetljo
