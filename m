Subject: Antwort: Re: [linux-lvm] MultiPath
Message-ID: <OF3FA18EC2.6DB9EC24-ONC1256D2F.00199A52@phoenixcontact.com>
From: "Dietmar Stein" <DStein@phoenixcontact.com>
MIME-Version: 1.0
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
Date: Thu May 22 23:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

Follow documentation / sample raidtab for multipathing, which comes with
raidtools. If you've done that, both paths should be used (we have tested
this once and it was working, also the failover of the active path).

Otherwise I would say there's a misconfiguration.

Dietmar



                                                                                                                                       
                      Ryan Frank                                                                                                       
                      <Ryan.Frank@twcab        An:       LVM List <linux-lvm@sistina.com>                                              
                      le.com>                  Kopie:                                                                                  
                      Gesendet von:            Thema:    Re: [linux-lvm] MultiPath                                                     
                      linux-lvm-admin@s                                                                                                
                      istina.com                                                                                                       
                                                                                                                                       
                                                                                                                                       
                      23.05.2003 00:56                                                                                                 
                      Bitte antworten                                                                                                  
                      an linux-lvm                                                                                                     
                                                                                                                                       
                                                                                                                                       




On Thu, 2003-05-22 at 17:57, Andrew Patterson wrote:
> On Thu, 2003-05-22 at 15:19, Ryan Frank wrote:
> > Hello All!
> >
> > I am running RedHat AS 2.1 2.4.9-e3custom kernel (Many reasons why so
> > old)... I have compiled in the the default LVM and multipath options in
> > the kernel.  I have also compiled in the new drivers for my FC Cards
> > (Qlogic 2300).  I can see all my storage... However! I cannot seem to
> > get the multipathing to work.  I see all 6 drives (3 from each card)...
> > Is there a magic trick to get the multipathing to work?  I am at a loss
> > here...
> >
>
> If you are using MD multipathing, you need to edit/create an
> /etc/raidtab file and then run mkraid or raidstart.  You then use a
> /dev/md* device to access your storage.
>

I got the MD device setup in raidtab I am using the "multipath"
personality... It is not utilizing both paths though... I started a
write, then pulled the active path to simulate failure, and it just died
:) fun fun... thanks for the help!

--
+----------------------------------------------------+
|Ryan Frank               Unix System Administrator  |
|Time Warner Cable        7910 Crescent Executive Dr.|
|(704) 731-3324 - phone   3rd Floor                  |
|(704) 731-1180 - fax     Charlotte, NC 28217        |
|150*143328*1 - nextel    ryan.frank@twcable.com     |
+----------------------------------------------------+

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
