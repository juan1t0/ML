%855899

function plot_bars_accs(accs,class_accs,sizes,ks,xlabels)
  w = sizes(1);
  h = sizes(2);

  xlabels = ['Overall' xlabels'];
  cl = length(xlabels);

  for i=1:length(ks)
    subplot(h,w,i);

    bar(1:cl,[accs(i) class_accs(i,:)]);
    %colororder("reef")
    xlabel('class');
    ylabel('ACC');
    title(['K=' num2str(ks(i))]);
    legend off;
  end
end
