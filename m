From: Scott Mcdermott <smcdermott@questra.com>
Subject: Re: [linux-lvm] Repair inconsistent PV
Message-ID: <20030818220805.GB513@questra.com>
References: <20030816154556.GA23415@debian.pakulat> <20030817012336.GA26462@debian.pakulat> <20030818214207.GC22587@debian.pakulat>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030818214207.GC22587@debian.pakulat>
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
Date: Mon Aug 18 17:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Pakulat on Mon 18/08 23:42 +0200:
> only wanted to notify everyone, that I could now solve my
> problem with hexedit and lvm.h. I changed the Major/Minor
> Numbers in both hdXX and then looked at the VG Data, I
> found that the one in hdc2 seemed OK, while the one in
> hda7 looked like random Data was written in it. So I
> copied the VG Metadata into hda7 using dd. A vgscan marked
> lvtmp as problematic, it was in hda7 but in the vgmetadata
> were only 3 LV's, so I changed that and threw out the LV
> Metadata of that particular lv. It is also the one I was
> deleting when the hardware error occured. Now I can read
> my data again.

that's cool investigative work...

just wondering out of curiosity...did you have a backup when
you did this? :)
