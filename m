Date: Mon, 11 Sep 2000 13:10:50 -0700 (PDT)
From: Cristina Bulfon <bulfon@SLAC.Stanford.EDU>
Subject: Re:[linux-lvm] LVM & NFS
In-reply-to: <39BCB409.69EEFE48@med.uni-tuebingen.de>
Message-id: <Pine.SOL.4.21.0009111310310.14336-100000@flora04.SLAC.Stanford.EDU>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
To: linux-lvm@msede.com
Cc: Rupert Kolb <rupert.kolb@med.uni-tuebingen.de>

On Mon, 11 Sep 2000, Rupert Kolb wrote:

> Content-Type: text/plain; charset=us-ascii
> Content-Transfer-Encoding: 7bit
> 
> > Hello,
> > 
> > I have a PC with RH 6.1 kernel 2.2.13, lvm kernel patch for 2.2.13, and
> > lvm 0.8-pre02,10.1999.
> > 
> > lvm works fine but when I tried to export a logical volume of 82GB, to
> > another Linux machine I got:
> > 
> > mount: my_server:/my_logica_volume failed, reason given by
> > server: Permission denied
> > 
> > I did the same NFS configuration with a small partition (not LVM) and it
> > worked.
> > 
> > Any idea ? Is there any special configuration/setting to export LVM
> > volumes via NFS?
> > 
> > Thanks in advance
> >         Cristina   
> 
> Hello Christina, 
> 
> I have the same problems (and I use reiserfs!).
> The error messages are varying depending on the client OS.
> I found, that I do not have the problems, if I use ext2 instead of
> reiserfs.
> 
> I found some interessting articles about the problem at:
> http://marc.theaimsgroup.com/?l=reiserfs&r=1&w=2
> Search there for 'lvm'.
> 
> I'm not on the lvm mailinglist. So please inform the list members 
> (especialy Paul Jakma ;-) about the reiserfs problems. 
> 
> -- 
> Rupert Kolb 
> 
> ======================================================================
> University Hospital, Department of Neuroradiology
> Hoppe-Seyler-Str. 3 
> D-72076 Tuebingen (Germany)
> Phone/Fax: ...-(0)7071-29-8-5396, ...-(0)7071-29-5638
> mailto:rupert.kolb@med.uni-tuebingen.de 
> http://www.medizin.uni-tuebingen.de/~rtkolb/
> ======================================================================
> 

_____________________________________________________________________________

       Cristina Bulfon              E-mail Cristina.Bulfon@slac.stanford.edu
Stanford Linear Accelerator Center  Phone +1-650-926-5028
PO Box 4349, M/S 88		    Fax   +1-650-926-3329
Stanford, CA 94309, USA
_____________________________________________________________________________
